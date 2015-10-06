class DownloadManagerActivity < Android::App::Activity
  attr_accessor :enqueue, :dm
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Main)
    receiver = DownloaderBroadcastReceiver.new
    registerReceiver(receiver, Android::Content::IntentFilter.new(Android::App::DownloadManager::ACTION_DOWNLOAD_COMPLETE))
  end

  def onClick(_view)
    @dm = getSystemService(Android::Content::Context::DOWNLOAD_SERVICE)
    request = Android::App::DownloadManager::Request.new(Android::Net::Uri.parse('https://avatars1.githubusercontent.com/u/1312687?v=3&s=460'))
    @enqueue = @dm.enqueue(request)
  end

  def showDownload(_view)
    i = Android::Content::Intent.new
    i.setAction(Android::App::DownloadManager::ACTION_VIEW_DOWNLOADS)
    startActivity(i)
  end
end
