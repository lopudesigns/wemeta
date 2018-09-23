### Weekly WeYouMe Development Update Log


#### 23/09/2018 
##### Hangout #25

###### Nikolaj Frey
* Authentication Interface testing
	* Current Bugs being worked on
		* "Missing Active Authority" when broadcasting account creation via RPC API
* Testnet private API server development
	* Problem
		* [WeAuth](https://github.com/weyoume/weauth) is a 2 part server/client repository for running privatised functions like creating user accounts on public request signed with WeYouMe controlled testnet accounts
	* Solution
		* Make a lightweight api server for allowing any private user to run network functions expanding the network without any unnecessary overhead which will reside at [WePrivateJs](https://github.com/weyoume/weprivatejs)
* Steem API downtime fix on [steem.weyoume.io](steem.weyoume.io)
	* Had to wait for an available wss:// API endpoint to come back online after the hardfork glitch [wss://gtg.steem.house:8090](gtg.steem.house) ended up being the first working API endpoint we could find.
* New developer equipment
	* 1 Development PC
		* Core i7 5960x
		* HyperX Predator 500GB M.2 SSD
		* GeForce GTX 690
		* GeForce GTX 570
	* Sourced 10 additional monitors for future devs
	* Associated tasks
		* Setting up new computer environment
			* Transferring project files
				* 10 hour+ transfer time due to usb2.0 limitation on source computer and 10/100 network limitation
				* Failed OSX SMB Share connection set-up due to Windows 10 Updates
					* Many hours wasted
					* ![OSX SMB Share not connectable from Windows 10 ](https://i.gyazo.com/2e041bd6e8237a90009c00c05795a322.png)
			* WSL (Windows Subsystem for Linux)
				* Installing
				* Configuring
					* Moving home directory from /home/user to /mnt/c/Users/user
				* Personalising
					* Install Cmder for helpful plugins like copy-paste and scroll fixes
			* VSCode (Visual Studio Code)
				* Preferences ported from previous workstation using [VSCode Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
				* VSCode integrated terminal set to WSL Bash.exe
			* Configure .bashrc profile