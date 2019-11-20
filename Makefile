timestamp		:= $(shell /bin/date "+%F %T")
image			:= registry.cn-shanghai.aliyuncs.com/yingzhuo/kafka
version			:= 2.3.1

no_default:
	@echo "no defualt target"

release:
	docker image build -t ${image}:${version} $(CURDIR)/${version}/

github:
	@git add .
	@git commit -m "$(timestamp)"
	@git push

.PHONY: no_default release github