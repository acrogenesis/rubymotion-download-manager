class DownloaderBroadcastReceiver < Android::Content::BroadcastReceiver
  def onReceive(context, intent)
    action = intent.action
    return unless Android::App::DownloadManager::ACTION_DOWNLOAD_COMPLETE.equals(action)
    # downloadId = intent.getLongExtra(Android::App::DownloadManager::EXTRA_DOWNLOAD_ID, 0)
    query = Android::App::DownloadManager::Query.new
    # query.setFilterById(@main_activity.enqueue) # crashes?
    c = context.dm.query(query)
    return unless c.moveToFirst
    column_index = c.getColumnIndex(Android::App::DownloadManager::COLUMN_STATUS)
    return unless Android::App::DownloadManager::STATUS_SUCCESSFUL == c.getInt(column_index)
    view = context.findViewById(R::Id::ImageView1)
    uri_string = c.getString(c.getColumnIndex(Android::App::DownloadManager::COLUMN_LOCAL_URI))
    view.setImageURI(Android::Net::Uri.parse(uri_string))
  end
end
