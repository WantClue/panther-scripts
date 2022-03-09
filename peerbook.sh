
	echo "download complete!"
	echo "stopping miner now"
	docker stop helium-miner
	curl -sLf https://raw.githubusercontent.com/WantClue/panther-scripts/main/peerbook_update -o /root/helium/overlay/docker.config
	docker start helium-miner
	echo "Done!"
	echo -e "In order to verify that the changes are working, run every few minutes \n"
	echo -e "sudo docker exec helium-miner miner peer book -c \n"
