package com.matburt.mobileorg.Gui.Capture;

import java.util.ArrayList;

import android.content.ContentResolver;
import android.util.Log;

import android.content.Intent;
import com.matburt.mobileorg.OrgData.OrgEdit;
import com.matburt.mobileorg.OrgData.OrgNode;
import com.matburt.mobileorg.OrgData.OrgProviderUtils;
import com.matburt.mobileorg.util.OrgNodeNotFoundException;
import com.matburt.mobileorg.util.OrgUtils;

public class EditActivityControllerAddChild extends EditActivityController {
	
	private String nodeOlpPath;

        public EditActivityControllerAddChild(long node_id, ContentResolver resolver, Intent intent, String defaultTodo) {

		this.resolver = resolver;

        if (intent != null) {
                this.node = OrgUtils.getCaptureIntentContents(resolver, intent);
                this.node.todo = defaultTodo;
        } else {
                this.node = new OrgNode();
        }
		
		this.node.todo = null;
		setupTodoAndParentId(node_id);
		
		if (this.node.todo == null)
			this.node.todo = defaultTodo;
		
		try {
			OrgNode parent = new OrgNode(node_id, resolver);
			this.nodeOlpPath = parent.getOlpId(resolver);
		} catch (OrgNodeNotFoundException e) {}
		
		this.node.addAutomaticTimestamp();
	}
	
	private void setupTodoAndParentId(long parentId) {
		if(parentId >= 0) {
			try {
				OrgNode parent = new OrgNode(parentId, resolver);
				OrgNode realParent = parent.findOriginalNode(resolver);
				this.node.parentId = realParent.id;
				this.node.todo = getTodo(realParent);
			} catch (OrgNodeNotFoundException e) {
				this.node.parentId = parentId;					
			}
		}
		else
			this.node.parentId = OrgProviderUtils
					.getOrCreateCaptureFile(resolver).nodeId;
	}
	
	private String getTodo(OrgNode parent) {
		if (parent == null)
			return null;
		
		ArrayList<OrgNode> children = parent.getChildren(resolver);
		
		if (children == null || children.size() == 0)
			return null;
		
		OrgNode lastSibling = children.get(children.size() - 1);
		return lastSibling.todo;
	}

	@Override
	public OrgNode getParentOrgNode() {
		try {
			OrgNode parent = new OrgNode(this.node.parentId, resolver);
			return parent;
		} catch (OrgNodeNotFoundException e) {}
		
		return new OrgNode();
	}

	@Override
	public void saveEdits(OrgNode newNode) {
		try {
			OrgEdit edit = newNode.createParentNewheading(resolver);
			edit.write(resolver);
		} catch (IllegalStateException e) {
			Log.e("MobileOrg", e.getLocalizedMessage());
		}
		newNode.write(resolver);		
	}

	@Override
	public String getActionMode() {
		return ACTIONMODE_ADDCHILD;
	}

	@Override
	public boolean hasEdits(OrgNode newNode) {
		return !this.node.equals(newNode);
	}
}
