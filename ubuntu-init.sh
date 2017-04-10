#!/bin/bash

# 说明：请使用bash命令运行脚本，否则会报错



# 构建图形化界面
GUI=$(zenity --list --checklist \
  --height="600" \
  --width="1000" \
  --title="Ubuntu16.04 快速配置工具" \
  --text="请从下面列表中选择需要设置或安装的项目" \
  --column="选择" --column="操作"	--column="描述" \
  TRUE "更新系统" "更新系统及应用软件包"  \
  FALSE "调整屏幕亮度" "调整屏幕默认亮度为40%，修改此值请在终端执行：xbacklight = 40%, 后面的值为需要设置默认亮度百分比" \
  FALSE "安装 fcitx 框架" "安装 fcitx 输入法框架，并安装搜狗拼音输入法" \
  FALSE "安装文泉驿字体套件" "安装文泉驿字体，优化中文显示效果" \
  FALSE "安装新立得软件包管理器" "新立得是Linux平台的老牌软件包软件工具，支持软件源管理、软件包管理功能" \
  FALSE "安装 unity-tweak-tool" "用于安装系统主题，进行系统其他配置" \
  FALSE "安装Flatabulous主题" "包含 ultra-flat-* 图标主题、Flatabulous 系统主题" \
  FALSE "添加 Oibaf 软件源" "这个库包含优化及更新过的开源显卡驱动" \
  FALSE "安装 DVD 支持库" "安装用于播放 DVD 的支持库" \
  FALSE "安装压缩文件支持库" "安装用于支持zip、rar文件的库及工具" \
  FALSE "安装受版权保护软件包" "安装受版权保护的软件包（如用于mp3、avi、mpeg的解码器等）" \
  FALSE "安装 GDebi" "用于方便的安装 deb 格式软件包" \
  FALSE "安装 Google Chrome" "安装谷歌浏览器" \
  FALSE "卸载系统自带的浏览器" "卸载系统自带的浏览器(Firefox)" \
  FALSE "安装 FeedReader" "FeedReader 是一款简洁高效的RSS阅读器" \
  FALSE "安装 GIMP" "GIMP 是跨平台的图像处理程序，号称 Linux 下的 PhotoShop" \
  FALSE "安装 BleachBit 系统清理工具" "可以清理系统缓存垃圾，不建议经常清理，偶尔清理下可以释放磁盘空间" \
  FALSE "安装 htop 系统监视器" "类似于windows下的“任务管理器”" \
  FALSE "安装 WPS" "安装 wps office" \
  FALSE "安装 LibreOffice" "安装 LibreOffice，开源免费的办公软件"\
  FALSE "安装 Shadowsocks" "主流翻墙软件，包含 Shadowsocks 及 GUI 配置工具" \
  FALSE "安装网易云音乐" "目前 Linux 平台唯一的在线音乐客户端" \
  FALSE "安装 Arronax" "用于创建或编辑启动器图标" \
  FALSE "安装 Shutter" "强大的截屏软件" \
  FALSE "安装有道词典" "有道词典 Linux 客户端" \
  FALSE "安装 Calibre" "强大的电子书管理软件，kindle 的好伴侣" \
  FALSE "安装 Synapse" "快速启动程序及搜索本地文件等" \
  FALSE "安装下载工具" "安装 qBittorrent、uget、aria2" \
  FALSE "安装 GParted" "硬盘分区编辑软件，可以无损修改分区大小，但建议编辑前做好数据备份" \
  FALSE "安装 Kazam" "简单好用的录屏软件" \
  FALSE "安装 Keepassx" "简单好用的密码管理软件" \
  FALSE "安装 Brasero" "强大的光盘刻录软件" \
  TRUE "修复损坏的软件包" "修复软件包依赖，修复无法启动的软件包" \
  TRUE "清理软件包" "删除系统冗余的软件包及清理本地软件包缓存" \
  --separator="|");

if [[ $GUI ]]
then

  # 更新系统操作
  if [[ $GUI == *"更新系统"* ]]
  then
    
  	echo "正在更新系统"
  	echo ""
  	sudo apt -y update
  	sudo apt -y full-upgrade
  fi

 

  # 调整屏幕默认亮度操作
  if [[ $GUI == *"调整屏幕亮度"* ]]
  then
  	
  	echo "正在调整屏幕亮度"
  	echo ""
    sudo apt -y install xbacklight
    xbacklight = 40%
  fi

  # 安装 fcitx 框架操作
  if [[ $GUI == *"安装 fcitx 框架"* ]]
  then 
    echo "正在下载搜狗输入法安装包"
    echo ""
    #wget http://linux-1251056822.file.myqcloud.com/ubuntu/sogoupinyin_2.1.0.0082_amd64.deb
    wget http://cdn2.ime.sogou.com/dl/index/1491565850/sogoupinyin_2.1.0.0086_amd64.deb -O sogoupinyin_2.1.0._amd64.deb
    echo "正在安装搜狗输入法"
    echo ""
    sudo dpkg -i sogoupinyin_2.1.0._amd64.deb
    sudo rm sogoupinyin_2.1.0._amd64.deb
    sudo apt-get install im-config
    echo "正在解决依赖关系"
    sudo apt-get -f -y install 
    
    echo "请在设置向导中选择fcitx为默认输入法框架，第二步请选择“Yes”"
    echo ""
    im-config
    echo "请点击+ 添加搜狗输入法"
    fcitx-config-gtk3
  fi

  # 安装文泉驿字体套件操作
  if [[ $GUI == *"安装文泉驿字体套件"* ]]
  then
  	
  	echo "正在安装文泉驿字体套件"
  	echo ""
  	sudo apt install -y fonts-wqy-microhei ttf-wqy-microhei
  fi

  # 安装新立得软件包管理器操作
  if [[ $GUI == *"安装文泉驿字体套件"* ]]
  then
  	
  	echo "正在安装新立得软件包管理器"
  	echo ""
  	sudo apt install -y synaptic
  fi

  # 安装 安装 unity-tweak-tool 操作
  if [[ $GUI == *"安装 unity-tweak-tool"* ]]
  then
  	
  	echo "正在安装 unity-tweak-tool"
  	echo ""
  	sudo apt -y install unity-tweak-tool
  fi

  # 安装扩展主题操作
  if [[ $GUI == *"安装Flatabulous主题"* ]]
  then
    echo "正在安装 Flatabulous 主题"
    echo ""
    sudo add-apt-repository ppa:noobslab/themes
    sudo apt-get update
    sudo apt-get install flatabulous-theme
    echo "正在安装 Flatabulous 图标主题"
    echo ""
    sudo add-apt-repository ppa:noobslab/icons
    sudo apt-get update
    sudo apt-get install ultra-flat-icons ultra-flat-icons-orange ultra-flat-icons-green
  fi

  # 添加 Oibaf 软件源操作
  if [[ $GUI == *"添加 Oibaf 软件源"* ]]
  then
  	
  	echo "正在添加 Oibaf 软件源"
  	echo ""
  	sudo add-apt-repository -y ppa:oibaf/graphics-drivers
  	sudo apt update
  	sudo apt -y full-upgrade
  fi

  # 安装 DVD 支持库操作
  if [[ $GUI == *"安装 DVD 支持库"* ]]
  then
  	
  	echo "正在安装 DVD 支持库"
  	echo ""
  	sudo apt -y install libdvdread4
  	sudo /usr/share/doc/libdvdread4/install-css.sh
  fi

  # 安装压缩文件支持库操作
  if [[ $GUI == *"安装压缩文件支持库"* ]]
  then
  	
  	echo "正在安装压缩文件支持库"
  	echo ""
  	sudo apt -y install zip unzip p7zip p7zip-rar rar unrar
  fi

  # 安装受版权保护软件包操作
  if [[ $GUI == *"安装受版权保护软件包"* ]]
  then
  	
  	echo "正在安装受版权保护软件包"
  	echo ""
  	sudo apt -y install ubuntu-restricted-extras
  fi

  # 安装 GDebi 操作
  if [[ $GUI == *"安装 GDebi"* ]]
  then
  	
  	echo "正在安装 GDebi"
  	echo ""
  	sudo apt -y install gdebi
  fi

  # 安装 Google Chrome 操作
  if [[ $GUI == *"安装 Google Chrome"* ]]
  then
  	
  	echo "正在安装 Google Chrome"
  	echo ""
  	wget http://linux-1251056822.file.myqcloud.com/ubuntu/google-chrome-stable_current_amd64.deb
  	sudo apt install libappindicator1 -y
        sudo dpkg -i google-chrome-stable_current_amd64.deb
        sudo rm google-chrome-stable_current_amd64.deb

  fi

  # 安装火狐浏览器操作
  if [[ $GUI == *"卸载系统自带的浏览器"* ]]
  then    
  	echo "正在卸载系统自带浏览器"
  	echo ""
    sudo apt remove --purge firefox -y
  fi

  # 安装 FeedReader 操作
  if [[ $GUI == *"安装 FeedReader"* ]]
  then
  	
  	echo "正在FeedReader"
  	echo ""
  	sudo apt -y install feedreader
  fi

  # 安装 GIMP 操作
  if [[ $GUI == *"安装 GIMP"* ]]
  then
  	
  	echo "正在安装GIMP"
  	echo ""
  	sudo apt -y install gimp
  fi

  # 安装 BleachBit 系统清理工具操作
  if [[ $GUI == *"安装 BleachBit 系统清理工具"* ]]
  then
  	
  	echo "正在安装BleachBit系统清理工具"
  	echo ""
  	sudo apt -y install bleachbit
  fi

  # 安装 Gnome 系统监视器操作
  if [[ $GUI == *"安装 htop 系统监视器"* ]]
  then
  	
  	echo "正在安装htop系统监视器"
  	echo ""
  	sudo apt -y install htop
  fi


  # 安装 WPS 操作
  if [[ $GUI == *"安装 WPS"* ]]
  then
    
    echo "正在下载WPS安装包"
    echo ""
    wget http://linux-1251056822.file.myqcloud.com/ubuntu/wps-office_10.1.0.5672-a21_amd64.deb
    
    echo "正在安装WPS"
    echo ""
    sudo dpkg -i wps-office_10.1.0.5672-a21_amd64.deb
    sudo rm wps-office_10.1.0.5672-a21_amd64.deb
  fi

  # 安装 LibreOffice 操作
  if [[ $GUI == *"安装 LibreOffice"* ]]
  then
    
    echo "正在安装LibreOffice"
    echo ""
    sudo apt -y install libreoffice
  fi

  # 安装 Shadowsocks 操作
  if [[ $GUI == *"安装 Shadowsocks"* ]]
  then
    
    echo "正在安装Shadowsocks"
    echo ""
    sudo add-apt-repository -y ppa:hzwhuang/ss-qt5
    sudo apt update
    sudo apt -y install shadowsocks shadowsocks-qt5
  fi

  # 安装网易云音乐操作
  if [[ $GUI == *"安装网易云音乐"* ]]
  then
    
    echo "正在下载网易云音乐安装包"
    echo ""
    wget http://linux-1251056822.file.myqcloud.com/ubuntu/netease-cloud-music_1.0.0_amd64_ubuntu16.04.deb
    
    echo "正在安装网易云音乐"
    echo ""
    sudo dpkg -i netease-cloud-music_1.0.0_amd64_ubuntu16.04.deb
    
    echo "正在安装网易云音乐依赖包"
    echo ""
    sudo apt -f -y install
    sudo rm netease-cloud-music_1.0.0_amd64_ubuntu16.04.deb
  fi

  # 安装 Arronax 操作
  if [[ $GUI == *"安装 Arronax"* ]]
  then
    
    echo "正在Arronax"
    echo ""
    sudo add-apt-repository -y ppa:diesch/testing
    sudo apt update
    sudo apt -y install arronax
  fi

  # 安装 Shutter 操作
  if [[ $GUI == *"安装 Shutter"* ]]
  then
    
    echo "正在Shutter"
    echo ""
    sudo apt -y install shutter
  fi

  # 安装有道词典操作
  if [[ $GUI == *"安装有道词典"* ]]
  then
    
    echo "正在下载有道词典安装包"
    echo ""
    wget http://linux-1251056822.file.myqcloud.com/ubuntu/libx264-146_0.146.2555_git0c21480-1_amd64.deb
    wget http://linux-1251056822.file.myqcloud.com/ubuntu/gstreamer0.10-plugins-ugly_0.10.19-2.1ubuntu3_amd64.deb
    wget http://linux-1251056822.file.myqcloud.com/ubuntu/youdao-dict_1.1.0-0-ubuntu_amd64.deb
    
    echo "正在安装有道词典"
    echo ""
    sudo apt install python3-pyqt5 python3-pyqt5.qtmultimedia python3-pyqt5.qtquick python3-pyqt5.qtwebkit python3-xlib tesseract-ocr tesseract-ocr-eng tesseract-ocr-chi-sim tesseract-ocr-chi-tra qtdeclarative5-controls-plugin libgstreamer0.10-0 libgstreamer-plugins-base0.10-0  -y
    sudo dpkg -i libx264-146_0.146.2555_git0c21480-1_amd64.deb
    sudo dpkg -i gstreamer0.10-plugins-ugly_0.10.19-2.1ubuntu3_amd64.deb
    sudo dpkg -i youdao-dict_1.1.0-0-ubuntu_amd64.deb
    sudo rm libx264-146_0.146.2555_git0c21480-1_amd64.deb
    sudo rm gstreamer0.10-plugins-ugly_0.10.19-2.1ubuntu3_amd64.deb
    sudo rm youdao-dict_1.1.0-0-ubuntu_amd64.deb
  fi

  # 安装 Calibre 操作
  if [[ $GUI == *"安装 Calibre"* ]]
  then
  	
  	echo "正在安装Calibre"
  	echo ""
  	sudo apt -y install calibre
  fi

  # 安装 Synapse 操作
  if [[ $GUI == *"安装 Synapse"* ]]
  then
  	
  	echo "正在安装Synapse"
  	echo ""
  	sudo apt -y install synapse
  fi

  # 安装下载工具操作
  if [[ $GUI == *"安装下载工具"* ]]
  then
  	
  	echo "正在安装qBittorrent"
  	echo ""
  	sudo apt -y install qbittorrent
    
  	echo "正在安装uget"
  	echo ""
  	sudo apt -y install uget
    
  	echo "正在安装aria2"
  	echo ""
    sudo apt -y install aria2
  fi

  # 安装 GParted 操作
  if [[ $GUI == *"安装 GParted"* ]]
  then
  	
  	echo "正在安装GParted"
  	echo ""
  	sudo apt -y install gparted
  fi

  # 安装 Kazam 操作
  if [[ $GUI == *"安装 Kazam"* ]]
  then
  	
  	echo "正在安装Kazam"
  	echo ""
  	sudo apt -y install kazam
  fi

  # 安装 Brasero 操作
  if [[ $GUI == *"安装 Brasero"* ]]
  then
  	
  	echo "正在安装Brasero"
  	echo ""
  	sudo apt -y install brasero
  fi



  if [[ $GUI == *"安装 Keepassx"* ]]
  then
  	
  	echo "正在安装Keepassx"
  	echo ""
  	sudo apt -y install keepassx
  fi


  # 修复损坏的软件包操作
  if [[ $GUI == *"修复损坏的软件包"* ]]
  then
  	
  	echo "正在修复损坏的软件包"
  	echo ""
  	sudo apt -y -f install
  fi

  # 清理软件包操作
  if [[ $GUI == *"清理软件包"* ]]
  then
  	
  	echo "正在清理软件包"
  	echo ""
  	sudo apt -y autoremove
  	sudo apt -y autoclean
  fi

  # 完成通知
  
  echo "配置完成，部分配置重启后生效。"

  echo "------------------------------------------------------------------"
  echo "交流群： QQ群:258348902  "          
  echo "------------------------------------------------------------------"
  notify-send -i utilities-terminal Ubuntu16.04快速配置工具 "配置完成，部分配置重启后生效。"


fi
