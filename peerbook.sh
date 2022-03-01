echo "Now I copy your old sys.conf to the new file sys.config.old"
	echo "Then I download the updated file"
	echo "Grab a beer and enjoy the increased PeerBook"
	
	echo "download complete!"
	echo "stopping miner now"
	docker stop helium-miner
	curl -sLf https://raw.githubusercontent.com/WantClue/panther-scripts/main/peerbook_update -o /root/helium/overlay/docker.config
	docker start helium-miner
	echo "Done!"
	echo -e "In order to verify that the changes are working, run every few minutes \n"
	echo -e "sudo docker exec helium-miner miner peer book -c \n"
