<?php
/*
*    This is Lazy8Web, a book-keeping ledger program for professionals
*    Copyright (C) 2010  Thomas Dilts                                 
*
*    This program is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or   
*    (at your option) any later version.                                 
*
*    This program is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of 
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the  
*    GNU General Public License for more details.                   
*
*    You should have received a copy of the GNU General Public License
*    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*
*/

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.

return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Lazy8Web',
	'language'=>'en',
	'sourceLanguage'=>'XXX',//this is to always force a translation,  

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'application.controllers.*',
	),
	// application components
	'components'=>array(
        	'messages'=>array(
           	  'class'=>'CDbMessageSourceLazy8'),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
			),
		),
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
		'db'=>array(
			'connectionString'=>'mysql:host=mariadb;port=3306;dbname=lazy8',
			'username'=>'lazy8',
			'password'=>'lazy8',
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
	),
	//The following modules may or may not exist
	'modules'=>array(
		'template',
		'billing',
		'inventory',
	),
);

