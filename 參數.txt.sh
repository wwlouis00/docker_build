docker  run	參數
docker  create	參數
		--name：自訂容器名稱
		-t：pseudo-tty
		-i：標準輸入
		
		-d：daemonized
		--rm：容器停止時自動刪除，不可與 -d 共用
		
		--link：
		--link   欲連接的容器名稱:連接別名				# '連接別名' 是給連接容器識別的別名
		-v /etc/localtime:/etc/localtime:ro
	
		-e "TZ=Asia/Taipei"			#  timezone
		
