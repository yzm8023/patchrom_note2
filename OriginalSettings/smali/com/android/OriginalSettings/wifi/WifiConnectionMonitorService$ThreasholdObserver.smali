.class Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService$ThreasholdObserver;
.super Landroid/database/ContentObserver;
.source "WifiConnectionMonitorService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ThreasholdObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;


# direct methods
.method public constructor <init>(Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "handler"

    .prologue
    .line 305
    iput-object p1, p0, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService$ThreasholdObserver;->this$0:Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;

    .line 306
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 307
    return-void
.end method

.method private getValue()I
    .locals 4

    .prologue
    .line 323
    iget-object v1, p0, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService$ThreasholdObserver;->this$0:Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;

    invoke-virtual {v1}, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wifi_connection_monitor_settings"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 326
    .local v0, value:I
    packed-switch v0, :pswitch_data_0

    .line 340
    const/16 v0, -0x55

    .line 344
    :goto_0
    return v0

    .line 328
    :pswitch_0
    const/16 v0, -0x55

    .line 329
    goto :goto_0

    .line 332
    :pswitch_1
    const/16 v0, -0x4b

    .line 333
    goto :goto_0

    .line 336
    :pswitch_2
    const/16 v0, -0x5a

    .line 337
    goto :goto_0

    .line 326
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public onChange(Z)V
    .locals 2
    .parameter "selfChange"

    .prologue
    .line 317
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 319
    iget-object v0, p0, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService$ThreasholdObserver;->this$0:Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;

    invoke-direct {p0}, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService$ThreasholdObserver;->getValue()I

    move-result v1

    #setter for: Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;->mThreshold:I
    invoke-static {v0, v1}, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;->access$202(Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;I)I

    .line 320
    return-void
.end method

.method public register()V
    .locals 3

    .prologue
    .line 310
    iget-object v0, p0, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService$ThreasholdObserver;->this$0:Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;

    invoke-virtual {v0}, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "wifi_connection_monitor_settings"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 312
    iget-object v0, p0, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService$ThreasholdObserver;->this$0:Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;

    invoke-direct {p0}, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService$ThreasholdObserver;->getValue()I

    move-result v1

    #setter for: Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;->mThreshold:I
    invoke-static {v0, v1}, Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;->access$202(Lcom/android/OriginalSettings/wifi/WifiConnectionMonitorService;I)I

    .line 313
    return-void
.end method
