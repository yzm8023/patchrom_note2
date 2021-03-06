.class public Lcom/android/OriginalSettings/MasterClearModemReset;
.super Landroid/app/Service;
.source "MasterClearModemReset.java"


# static fields
.field private static called:Z


# instance fields
.field private mDelayRunnable:Ljava/lang/Runnable;

.field private mHandler:Landroid/os/Handler;

.field private mPhone:Lcom/samsung/android/sec_platform_library/FactoryPhone;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 68
    new-instance v0, Lcom/android/OriginalSettings/MasterClearModemReset$1;

    invoke-direct {v0, p0}, Lcom/android/OriginalSettings/MasterClearModemReset$1;-><init>(Lcom/android/OriginalSettings/MasterClearModemReset;)V

    iput-object v0, p0, Lcom/android/OriginalSettings/MasterClearModemReset;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/OriginalSettings/MasterClearModemReset;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/android/OriginalSettings/MasterClearModemReset;->sendMasterClearIntent()V

    return-void
.end method

.method private sendMasterClearIntent()V
    .locals 2

    .prologue
    .line 86
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/OriginalSettings/MasterClearModemReset;->called:Z

    .line 87
    sget-boolean v0, Lcom/android/OriginalSettings/MasterClearModemReset;->called:Z

    if-eqz v0, :cond_0

    .line 91
    :goto_0
    return-void

    .line 89
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/OriginalSettings/MasterClearModemReset;->called:Z

    .line 90
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MASTER_CLEAR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/android/OriginalSettings/MasterClearModemReset;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private sendResetCommandToRIL()V
    .locals 5

    .prologue
    .line 51
    new-instance v0, Lcom/samsung/android/sec_platform_library/PacketBuilder;

    const/16 v1, 0xc

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/samsung/android/sec_platform_library/PacketBuilder;-><init>(BB)V

    .line 60
    .local v0, packet:Lcom/samsung/android/sec_platform_library/PacketBuilder;
    invoke-static {}, Lcom/android/OriginalSettings/Utils;->isDomesticModel()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v1

    const-string v2, "CscFeature_Setting_EnableModemResetDuringFactoryReset"

    invoke-virtual {v1, v2}, Lcom/sec/android/app/CscFeature;->getEnableStatus(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 61
    :cond_0
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/samsung/android/sec_platform_library/PacketBuilder;->addData(B)Lcom/samsung/android/sec_platform_library/PacketBuilder;

    .line 65
    :goto_0
    iget-object v1, p0, Lcom/android/OriginalSettings/MasterClearModemReset;->mPhone:Lcom/samsung/android/sec_platform_library/FactoryPhone;

    invoke-virtual {v0}, Lcom/samsung/android/sec_platform_library/PacketBuilder;->getPacket()[B

    move-result-object v2

    iget-object v3, p0, Lcom/android/OriginalSettings/MasterClearModemReset;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x3f0

    invoke-virtual {v3, v4}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/samsung/android/sec_platform_library/FactoryPhone;->invokeOemRilRequestRaw([BLandroid/os/Message;)V

    .line 66
    return-void

    .line 63
    :cond_1
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/samsung/android/sec_platform_library/PacketBuilder;->addData(B)Lcom/samsung/android/sec_platform_library/PacketBuilder;

    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "arg0"

    .prologue
    .line 95
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 100
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 102
    invoke-static {}, Lcom/android/OriginalSettings/Utils;->isMonkeyRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    invoke-virtual {p0}, Lcom/android/OriginalSettings/MasterClearModemReset;->stopSelf()V

    .line 108
    :goto_0
    return-void

    .line 107
    :cond_0
    new-instance v0, Lcom/samsung/android/sec_platform_library/FactoryPhone;

    invoke-direct {v0, p0}, Lcom/samsung/android/sec_platform_library/FactoryPhone;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/OriginalSettings/MasterClearModemReset;->mPhone:Lcom/samsung/android/sec_platform_library/FactoryPhone;

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 112
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 113
    iget-object v0, p0, Lcom/android/OriginalSettings/MasterClearModemReset;->mPhone:Lcom/samsung/android/sec_platform_library/FactoryPhone;

    invoke-virtual {v0}, Lcom/samsung/android/sec_platform_library/FactoryPhone;->disconnectFromRilService()V

    .line 114
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 6
    .parameter "intent"
    .parameter "startId"

    .prologue
    const/4 v4, 0x0

    .line 117
    const-string v3, "FACTORY"

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 118
    .local v0, callByFactory:Z
    if-nez v0, :cond_0

    .line 122
    invoke-virtual {p0}, Lcom/android/OriginalSettings/MasterClearModemReset;->stopSelf()V

    .line 146
    :goto_0
    return-void

    .line 127
    :cond_0
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-direct {v2, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 128
    .local v2, progressDialog:Landroid/app/ProgressDialog;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 129
    invoke-virtual {v2, v4}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 130
    invoke-virtual {v2}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/16 v4, 0x7d3

    invoke-virtual {v3, v4}, Landroid/view/Window;->setType(I)V

    .line 131
    const v3, 0x1040187

    invoke-virtual {p0, v3}, Lcom/android/OriginalSettings/MasterClearModemReset;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 132
    invoke-virtual {v2}, Landroid/app/ProgressDialog;->show()V

    .line 134
    const-string v3, "MasterClearModemReset"

    const-string v4, "Modem reset started..."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    invoke-direct {p0}, Lcom/android/OriginalSettings/MasterClearModemReset;->sendResetCommandToRIL()V

    .line 137
    new-instance v3, Lcom/android/OriginalSettings/MasterClearModemReset$2;

    invoke-direct {v3, p0}, Lcom/android/OriginalSettings/MasterClearModemReset$2;-><init>(Lcom/android/OriginalSettings/MasterClearModemReset;)V

    iput-object v3, p0, Lcom/android/OriginalSettings/MasterClearModemReset;->mDelayRunnable:Ljava/lang/Runnable;

    .line 144
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 145
    .local v1, mTimerHandler:Landroid/os/Handler;
    iget-object v3, p0, Lcom/android/OriginalSettings/MasterClearModemReset;->mDelayRunnable:Ljava/lang/Runnable;

    const-wide/16 v4, 0x4650

    invoke-virtual {v1, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
