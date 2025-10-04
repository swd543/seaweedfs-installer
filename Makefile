get-latest-release:
	@latest_release=$$(curl -s https://api.github.com/repos/seaweedfs/seaweedfs/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') && \
	binary_name="linux_arm64" && \
	echo "Latest SeaweedFS release: $${latest_release}" && \
	curl -L -o seaweedfs_$${binary_name}.tar.gz https://github.com/seaweedfs/seaweedfs/releases/download/$${latest_release}/$${binary_name}.tar.gz && \
	mkdir -p bin && \
	tar -xzf seaweedfs_$${binary_name}.tar.gz -C bin

clean:
	rm seaweedfs*.tar.gz

install: get-latest-release clean
	@sudo update-alternatives --install /usr/local/bin/weed weed $$(pwd)/bin/weed 100 && \
	weed autocomplete

uninstall:
	@weed autocomplete.uninstall
	@sudo update-alternatives --remove weed $$(pwd)/bin/weed
	@rm -rf bin
	@sed -i '/seaweedfs\/bin/d' ~/.bashrc || true
	
start-server:
	@nohup weed server -ip=localhost -master.port=9333 -volume.port=8080 -filer -s3 > server.log 2>&1 &

stop-server:
	@pkill -f "weed server"

stop: stop-server
	@echo "SeaweedFS server stopped."

start-all: start-server
	@echo "SeaweedFS server started."