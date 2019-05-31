# ClarifaiAPI@Demo v.1.0.0 (Node.js-Demo)

![fig_title](https://user-images.githubusercontent.com/24288051/58696652-abb0af80-83a0-11e9-9ec1-ffe4eea88a79.png)

### How To Install And Use This Project

ClarifaiAPI@Demo v.1.0.0 requires [Node.js](https://nodejs.org/) v4+ to run.

### Prerequisites

To install and use ClarifaiAPI@Demo v.1.0.0 Node.js demo, you must install the following software:

 - [Node.js 10.15.1 LTS for Windows (x64)](https://www.nodejs.org/)
 - [MySQL Community Server (Current Generally Available Release: 8.0.15)](https://dev.mysql.com/downloads/)

After you've successfully install these products and properly setup MySQL server you can proceed with the next installation and configuration steps.

### Step 1: Create Database And Import Data

1. Open MySQL Workbench 8.0 CE and locate **Data Import/Restore** option under **Administration** tab by clicking it in the sidebar leftside your MySQL Workbench window:
![fig1](https://user-images.githubusercontent.com/24288051/52999349-37c04c00-342e-11e9-9998-9af308c5dd60.jpg)
2. In the **Administration - Data Import/Restore** tab of the MySQL Workbench window, select **Import from Disk** tab below and toggle select file [**...**] button.
3. Select a folder containing **clarifai_imagebase.sql** file. In this case, this file is located in the main projects folder, for example: (**<path-on-your-drive>/clarifai_demo/**). After you've selected a proper directory containing this sql-file, **clarifai_imagebase** database schema icon will appear under the **Select Database Objects To Import** list view:
![fig2](https://user-images.githubusercontent.com/24288051/58696748-d8fd5d80-83a0-11e9-8db9-815bc4969c05.png)
4. Finally, locate and click **Start Import** button in the bottom-right corner of the **Import from Disk** tab, to launch the database creation and data import process.
![fig3](https://user-images.githubusercontent.com/24288051/58696761-e1ee2f00-83a0-11e9-8f50-17a6f34ec46d.png)

### Step 2: Installing Node.js Modules Dependencies

The ClarifaiAPI@Demo v.1.0.0 project relies on using the number of Node.js modules, from npmjs.org repository, created by the other side-developers. To install these modules you must use the following command in the Node.js command prompt:

``` sh
<path-on-your-drive>\clarifai_demo\>npm install --save
```

By executing the following command all required Node.js modules, specified in ***package.json*** file will be installed to the **<path-on-your-drive>\clarifai_demo\node_modules** folder.

### Step 3: Running ClarifaiAPI@Demo v.1.0.0 Express Server:

Finally, all what you have to do next is to launch ClarifaiAPI@Demo v.1.0.0 server web-application. To do this you must type in the following in your Node.js command prompt:
``` sh
<path-on-your-drive>\clarifai_demo\>npm update & npm start
```

### Step 4: Configuring ClarifaiAPI@Demo v.1.0.0 Application

To properly configure the application being installed we must edit the following configuration files:

## .env

CLARIFAI_API_KEY='<YOUR_CLARIFAI_API_KEY_GOES_HERE>'

## mysql.json

{ "host": "<MY_SQL_HOST_IP_ADDRESS>", 
  "port": 3306, 
  "user": "<USER_NAME>", 
  "password": "<PASSWORD>", 
  "database": "clrfai_imagebase" }

### Step 5: Using ClarifaiAPI@Demo v.1.0.0 Application Installed

To do use ClarifaiAPI@Demo v.1.0.0 web application, all what you have to do is to open your local web-browser and type in the following address in the address bar at the top:

``` sh
http://localhost:3000/
```
***That's all folks, enjoy using the application!***

### Author

***Author: Arthur V. Ratz @ CodeProject (CPOL License)***

### License

***CPOL - CodeProject's Open License***"# clarifai_demo-1.0.0" 
"# clarifai_demo-1.0.0" 
"# clarifai_demo-1.0.0" 
"# clarifai_demo-1.0.0" 
"# clarifai_demo-1.0.0" 
"# clarifai_demo-1.0.0" 
