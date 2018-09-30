### WeMeta

[WeMeta.json](https://github.com/weyoume/wemeta/blob/dev/meta.json)


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
* Created automated dependancy based republisher for multiple WeYouMe repositories and npm packages
	* Problem
		* When making changes in a heavily dependant library such as [WeCryptoJs](https://github.com/lopudesigns/wecryptojs) it is a pain to manually rebuild, test, commit, push, and republish all libraries which also depend on that library.
	* Solution
		* We created [WePublish](https://github.com/lopudesigns/wepublish) which is a bash and nodejs program which can walk through a directory structure of packages in a specified dependant order, rebuild, test, commit, push, and republish all the libraries given to it in an automated fashion
		* ![Part 1 run WePublish](https://media.giphy.com/media/8PaTfLElK6SfCy6x3f/100.webp)
		* ![Part 2 WePublish](https://media.giphy.com/media/1BfREhmbWX9jTZfoJX/100.webp)
		* ![Part 3 WePublish](https://media.giphy.com/media/ygAnXSZjhnSh8uYzGQ/100.webp)
		
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

### Weekly WeYouMe Development Update Log

#### 30/09/2018 
##### Hangout #26

###### Nikolaj Frey
* Authentication Interface Finalisation
	* Final testing
		* tested and working
	* Modifications
		* Login modification
			* Added a sign-up link on all login prompts
				* Before
					* ![Steemconnect log in popup](https://i.gyazo.com/6dba03d8fba9bf635c9959e65dd968f0.png)
				* After
					* ![Steemconnect log in popup](https://i.gyazo.com/6883839dd703914d61810d62555181c5.png)
			* Added password login support
				* For proxy accounts
					* Problem
						* a proxy account inherits the public keys of the creator account, but when trying to log-in with the password used for the creator account it fails because the login algorithm uses the proxy accounts username in the WIF generation process. 
					* Solution
						* So we check account_auth usernames and generate WIF keys based off those values too
				* For non-standard permission public keys
					* Problem
						* If an account was generated with all permission public keys set as the owner public key, loggin in would not work because the login algorithm generates the memo public key using the username+password+permission algorithm but the account does not have that public key assosciated with it
					* Solution
						* For loop and generate all possible public keys and then check if any match any of the permission keys
		* Sign up/Register/Create account modification
			* Hide TME fee input and SCORE transfer input and replace with a "show-more" button
			* Auto fill TME fee for account creation
			* No suggested password
			* Hide password input like any other form
			* Before
				* ![Steemconnect register/accounts/create modal](https://i.gyazo.com/0e4d839b2ab2d3c45255fade88869299.png)
			* After
				* ![Steemconnect register/accounts/create modal Part 1](https://i.gyazo.com/f23daf86271de16ae58d07f6ee6f1fad.png)
				* ![Steemconnect register/accounts/create modal Part 2](https://i.gyazo.com/7c50a2cb3547004410a1ae4f6897fba8.png)
		* Navigation additions
			* Added Login, Register, and Console button links to the landing page
				* Before
					* ![Steemconnect Landing Page](https://i.gyazo.com/eb15bad063ffb4f95d7965b0e9bf34f6.png)
				* After
					* ![WeAuth Landing Page](https://i.gyazo.com/929c74c86d16377bbea5ea476fcd46f3.png)	
			* Added Home, Login, Register, and Console button links to the console page
			* Added New Account button to the console page
				* Before
					* ![Steemconnect Console/Dashboard](https://i.gyazo.com/d1256d4fd805bb4cbede63e2d080b37f.png)	
				* After
					* ![WeAuth Console/Dashboard](https://i.gyazo.com/02cbe76d3e89072ed3e1b8160661361b.png)	
		* Url changes
			* added /register support ontop of /accounts/create
		