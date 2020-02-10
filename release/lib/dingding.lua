M.dd_pkg = "com.alibaba.android.rimet/"
M.dd_activity = "com.alibaba.android.rimet/com.alibaba.android.rimet.biz.home.activity.HomeActivity"
M.dd_search_activity = "com.alibaba.android.rimet/com.alibaba.android.search.activity.GlobalSearchActivity"
M.dd_home = "com.alibaba.android.rimet/com.alibaba.android.rimet.biz.LaunchHomeActivity"

M.open_dd_search = function()
   local top_window, i
   local max_times = 6
   for i = 1, max_times do
      if not top_activity_match(M.dd_pkg) then
         start_app("com.alibaba.android.rimet")
      end

      if M.m_focused_window == M.dd_search_activity then
         log("found dd search window")
         if find_scene("dd-sousuo-shanchu") then
            jump_out_of("dd-sousuo-shanchu")
            return
         end
         log("not found dd search window: %s", M.m_focused_window)
      elseif M.m_focused_window ~= M.dd_home then
         adb_back_from_activity()
      else
         local found_grey = find_scene("dd-xiaoxi-weixuanzhong")
         local found_duihua = find_scene("dd-xiaoxi-xuanzhong")
         if not found_grey and not found_duihua then
            if i >= 4 then
               M.g_find_scene_debug = true
            else
               adb_back_from_activity()
            end
         elseif found_grey then
            jump_from_to("dd-xiaoxi-weixuanzhong", "dd-xiaoxi-xuanzhong")
            found_duihua = 1
         end

         if found_duihua then
            jump_from_to("dd-xiaoxi-dd-biaoti", "dd-xiaoxi-sousuo", {click_times = 2, x = 200})
            jump_from_to("dd-xiaoxi-sousuo", "dd-xiaoxi-sousuozhong")
            return
         end
      end
   end
end

M.wrench_find_dingding_contact = function(friend_name)
   putclip_nowait(friend_name)
   open_dd_search()
   adb_event"key scroll_lock key enter sleep .8"
   click_scene("dd-NiKeNengXiangZhao", {y = 200, x = 100})
end

M.dingding_open_homepage = function()
   local dingding_splash = "com.alibaba.android.rimet/com.alibaba.android.rimet.biz.SplashActivity"
   local dingding_home = "com.alibaba.android.rimet/com.alibaba.android.rimet.biz.home.activity.HomeActivity"
   adb_am("am start -n " .. dingding_splash)
   wait_top_activity_match("com.alibaba.android.rimet/")
   for i = 1, 20 do
      sleep(.1)
      local window = adb_top_window()
      if window then
         log("dd: window is %s at %d", window, i)
      end
      if window and window ~= dingding_splash and window ~= dingding_home then
         if window == "com.alibaba.android.rimet/com.alibaba.android.user.login.SignUpWithPwdActivity" then
            log("You need to sign in dingding")
            break
         end
         log("dd: window is %s at %d", window, i)
         adb_event"key back sleep .1"
         sleep(.1)
         adb_am("am start -n " .. dingding_splash)
         wait_top_activity_match("com.alibaba.android.rimet/")
      elseif window == dingding_splash then
         adb_event"adb-tap 863 222"
      elseif window == dingding_home then
         break
      end

   end
end

M.click_dingding_pics = function(npics)
   local pic_share_buttons = {}

   local click_2x1_x = scene_x("dingding-fatu-1")
   local click_2x1_y = scene_y("dingding-fatu-1")

   local click_3x1_x = scene_x("dingding-fatu-2")
   local click_3x1_y = scene_y("dingding-fatu-2")

   local click_2x2_x = scene_x("dingding-fatu-3")
   local click_2x2_y = scene_y("dingding-fatu-3")

   local cell_height = math.floor(click_2x2_y - click_2x1_y)
   local cell_width = math.floor(click_3x1_x - click_2x1_x)

   for i = 1, npics do
      local col = i % 4
      local row = math.floor(i / 4)

      local tap_x = cell_width * (col - 1) + click_2x1_x + 14
      local tap_y = cell_height * row + click_2x1_y + 20

      pic_share_buttons[i] = ("adb-tap-XY %d %d"):format(tap_x, tap_y)
      log("dingding tap: %d %s", i, pic_share_buttons[i])
      local button = pic_share_buttons[i]
      adb_event("sleep .2 " .. button .. " sleep .1")

      if i == 1 then
         jump_from_to("dingding-yuantu-weixuanzhong", "dingding-yuantu-yixuanzhong")
      end

   end
end

M.picture_to_dingding_chat = function(pics, ...)
   if type(pics) ~= "table" then
      pics = {pics, ...}
   end

   adb_shell(
      [[
            for x in /sdcard/Wrench-DingDing/*; do
               if test -e "$x"; then
                  rm -rf "$x";
                  am startservice --user 0 -n com.bhj.setclip/.PutClipService --es picture "$x";
               fi;
            done;
            mkdir /sdcard/Wrench-DingDing/;
            cp /sdcard/DCIM/Camera/000-wrench-* /sdcard/Wrench-DingDing/;
            for x in /sdcard/Wrench-DingDing/000-wrench-*; do
                if test -e "$x"; then
                    am startservice --user 0 -n com.bhj.setclip/.PutClipService --es picture "$x";
                fi;
            done

   ]])

   local dd_extra_button="dingding-liaotian-gengduo-gongneng"
   if ime_is_active() then
      dd_extra_button = dd_extra_button .. "@ime"
   end

   jump_from_to(dd_extra_button, "dingding-xiangce-button")
   jump_from_to("dingding-xiangce-button", "dingding-paishe-zhaopian")

   click_dingding_pics(#pics)
   if yes_or_no_p"Confirm to send these pictures to dingding" then
      jump_from_to("dingding-tupian-fasong", "dingding-xiangce-button")
   else
      adb_event("key back")
   end

   adb_event("key back")
end

M.get_out_of_windows = function(windows, ...)
   if type(windows) ~= "table" then
      windows = {windows, ...}
   end

   for i = 1, 20 do
      if not member(adb_top_window(), windows) then
         return
      end
      sleep(.2)
   end

   prompt_user("试了很多次，还是在 %s 里，小扳手的自动化脚本可能有问题，请检查一下", adb_top_window())
   error("Failed to get out of %s", join(", ", windows))
end

M.need_confirm = function(fmt, ...)
   if yes_or_no_p(fmt, ...) then
      return true
   else
      return false
   end
end

M.wrench_picture = function (...)
   local pics = upload_pics(...)
   local window = adb_top_window()
   if window == W.weixinLauncherActivity and yes_or_no_p("发送给当前微信聊天窗口") then
      return picture_to_weixin_chat(pics)
   elseif window == "com.tencent.mm/com.tencent.mm.plugin.scanner.ui.BaseScanUI" then
      return M.picture_to_weixin_scan(pics)
   elseif window:match("^com.tencent.mm/com.tencent.mm.ui.chatting") then
      if yes_or_no_p("发送给当前微信聊天窗口") then
         return picture_to_weixin_chat(pics)
      end
   elseif window == "com.tencent.mobileqq/com.tencent.mobileqq.activity.ChatActivity" then
      if yes_or_no_p("发送给当前 QQ 聊天窗口") then
         return picture_to_qq_chat(pics)
      end
   elseif window == "com.alibaba.android.rimet/com.alibaba.android.dingtalkim.activities.ChatMsgActivity" then
      if yes_or_no_p("发送给当前钉钉聊天窗口") then
         return picture_to_dingding_chat(pics)
      end
   elseif window == "com.tencent.mobileqq/com.tencent.mobileqq.activity.SplashActivity" then
      if yes_or_no_p("发送给当前 QQ 聊天窗口") then
         return picture_to_qq_chat(pics)
      end
   elseif window == "com.sina.weibo/com.sina.weibo.weiyou.DMSingleChatActivity" then
      if yes_or_no_p("发送给当前微博私信聊天窗口") then
         return picture_to_weibo_chat(pics)
      end
   elseif window == W.weiboCommentActivity or window == W.weiboForwardActivity then
      if yes_or_no_p("发送给当前微博回复窗口") then
         return picture_to_weibo_comment(pics)
      end
   end
   if yes_or_no_p("不知道此窗口（" .. window .. "）下如何分享图片，如需继续上传，请点击确认后选择把图片发给谁，否则请点取消") then
      local how_to_send = M.select_args_with_history("how-to-send-pic",
         "请输入微信、QQ 联系人搜索方式或选择如何分享",
         "再试一下发送给新的当前窗口",
         "分享到微信朋友圈",
         "分享到微博",
         "输入 XXX@@wx 并回车发给微信联系人 XXX",
         "输入 XXX@@qq 并回车发给 QQ 联系人 XXX",
         "输入 XXX@YYY@@qq 并回车发给 QQ 群 YYY 里的联系人 XXX"
         )

      if how_to_send == "分享到微信朋友圈" then
         picture_to_weixin_share()
         return
      elseif how_to_send == "分享到微博" then
         picture_to_weibo_share()
         return
      elseif how_to_send == "再试一下发送给新的当前窗口" then
         return wrench_picture()
      else
         wrench_call(how_to_send)
         sleep(1)
         return wrench_picture()
      end
   end
   return #pics .. " pictures sent"
end


M.press_dial_key = function()
   if not where_is_dial_key then
      where_is_dial_key = phone_info_map[android_serial .. ":拨号键位置"]
      if not where_is_dial_key then
         where_is_dial_key = select_args{"Where is the dial button？", "Middle", "First from left", "Second from left"}
         phone_info_map[android_serial .. ":拨号键位置"] = where_is_dial_key
         save_phone_info()
      end
   end
   debugging("where_is_dial_key is %s", where_is_dial_key)
   if where_is_dial_key == "Middle" then
      adb_event("adb-tap 554 1668")
   elseif where_is_dial_key == "First from left" then
      adb_event"adb-tap 156 1633"
   elseif where_is_dial_key == "Second from left" then
      adb_event"adb-tap 420 1634"
   else
      adb_event("adb-tap 554 1668")
      log("Error: unknown where_is_dial_key: %s, must be one of Middle, First from left, Second from left.\n\nPlease update %s", where_is_dial_key, M.configDirFile("phone_info.lua"))
      where_is_dial_key = nil
   end
end

M.emoji_for_dingding = function(text)
   return emoji_rewrite(text, dingding_emojis_remap)
end

M.dingding_emojis_remap = {
   ["[街舞]"] = "[跳舞]", ["[捂脸]"] = "[捂脸哭]", ["[100 分]"] = "[100分]"
}
