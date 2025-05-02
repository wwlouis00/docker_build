docker  run	參數
docker  create	參數
		-v：掛載 空的 data-volumes目錄，或從本機掛載 data-volumes目錄
		-v：多個 -v 可掛載多個 data-volumes目錄，本機目錄相對路徑或絕對路徑，目錄不存在會自動建，容器目錄則需絕對路徑
		-v  /containerDir
		-v  ~/src/hostDir:/opt/containerDir
		-v  本機目錄:/容器絕對路徑目錄
		-v  ~/src/hostDir:/opt/containerDir:ro			# 預設為可讀寫， :ro 修改為唯讀
		


data-volumes-container：一個提供自身目錄給其他容器掛載的容器

docker  run	參數
docker  create	參數
		--volumes-from：掛載其他容器的 data-volumes目錄
		--volumes-from：多個 --volumes-from 可掛載多個其他容器的 data-volumes目錄
		--volumes-from  容器名稱			#  容器可以是停止狀態



