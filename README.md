# Trello Api Project

### Exemple of cucumber project using Trello APIs.

##### To run the project you need to create your APP_KEY and TOKEN authorization credentials on Trello. To do so, follow the steps:
###### Access: `https://trello.com/app-key`, copy the KEY showed in the screen. This is your APP_KEY.
###### Access the url below replaceing generated KEY above on APP_KEY to create your TOKEN.
`
https://trello.com/1/authorize?key=APP_KEY&name=app_name&response_type=token&scope=read,write,delete,account&expiration=never
`
###### More information: `https://developers.trello.com/authorize`

##### Cucumber Tags
- @quadros #feature tag, related to all scenarios on quadros_trello.feature
- @criar_quadro #all scenarios that creates boards
- @kanban #create a basic kanban board
- @semanal #create a week board
- @deletar_quadro #delete boards by name
##### Command line example
`cucumber -@criar_quadro APP_KEY=your_key TOKEN=your_token`

##### Steps to run:
```sh
- git clone the project
- gem install bundler
- bundle
- cucumber APP_KEY=your_key TOKEN=your_token
```
###### Trello API Info: `https://developers.trello.com/advanced-reference`
