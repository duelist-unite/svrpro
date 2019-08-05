## SRVPro 一 YGOPro Servers

### Features
* Runs on Linux and Windows
* Players can enter the same room by name
* If players do not specify the room name then they will automatically be matched to an online player.
* Room List in JSON Format
* Broadcast Messaging
* Summon Lines
* One-click Card Updates
* WindBot Online AI
* User Login
* Torrenment Mode - Locks Deck
* Torrenment Mode - Saves Replays
* Torrenment Mode - Overtime system (Adjustable)
  * 0 Normal Overtime Rules
  * 1 YGOCore Team Alliance 12th League Rules
  * 2 Normal Overtime Rules + 1 Win Rules
  * 3 OCG/TCG Overtime Rules applicable in July 2018
* Automatic Reconnect

### Unsupported Features
* Online Chat Room

### Install
```bash
# Navigate to install directory (server folder will be created in this path)
cd ~/
source <(curl -s https://gitlab.com/duelists-unite/srvpro/raw/master/install.sh)
```
  * If you wish to use the Torrenment Mode, it is recommended to change the startup command to `pm2-docker start /ygopro-server/data/pm2-docker-tournament.js`

### TODO
* Refactoring CTOS and STOC
* Change features to modules
  * Room name parsing
  * Random duel
  * Summon dialogues
  * WindBot
  * Cloud replay
  * Tournament mode
  * Expansions updater
* User and admin account system
* New database for cloud replay

### License
SRVPro

Copyright (C) 2013-2018  MoeCube Team

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
