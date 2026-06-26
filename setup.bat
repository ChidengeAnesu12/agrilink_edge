@echo off
REM AgriLink Edge - Project Structure Creator

REM Core
md lib\app\bootstrap
md lib\core\constants
md lib\core\config
md lib\core\errors\exceptions
md lib\core\extensions
md lib\core\helpers
md lib\core\permissions
md lib\core\services
md lib\core\utils
md lib\core\theme
md lib\routes
md lib\localization
md lib\l10n
md lib\generated

REM Shared Widgets
md lib\widgets\dialogs
md lib\widgets\animations
md lib\widgets\cards
md lib\widgets\buttons
md lib\widgets\inputs
md lib\widgets\charts
md lib\widgets\shared

REM Assets
md assets\images
md assets\icons
md assets\animations
md assets\fonts

REM Feature: authentication
md lib\features\authentication\presentation\pages
md lib\features\authentication\presentation\widgets
md lib\features\authentication\presentation\controllers
md lib\features\authentication\presentation\providers
md lib\features\authentication\domain\entities
md lib\features\authentication\domain\usecases
md lib\features\authentication\domain\repositories
md lib\features\authentication\data\datasources
md lib\features\authentication\data\models
md lib\features\authentication\data\repositories
md lib\features\authentication\data\services
md lib\features\authentication\bridge
md lib\features\authentication\routes

REM Feature: dashboard
md lib\features\dashboard\presentation\pages
md lib\features\dashboard\presentation\widgets
md lib\features\dashboard\presentation\controllers
md lib\features\dashboard\presentation\providers
md lib\features\dashboard\domain\entities
md lib\features\dashboard\domain\usecases
md lib\features\dashboard\domain\repositories
md lib\features\dashboard\data\datasources
md lib\features\dashboard\data\models
md lib\features\dashboard\data\repositories
md lib\features\dashboard\data\services
md lib\features\dashboard\bridge
md lib\features\dashboard\routes

REM Feature: diagnosis
md lib\features\diagnosis\presentation\pages
md lib\features\diagnosis\presentation\widgets
md lib\features\diagnosis\presentation\controllers
md lib\features\diagnosis\presentation\providers
md lib\features\diagnosis\domain\entities
md lib\features\diagnosis\domain\usecases
md lib\features\diagnosis\domain\repositories
md lib\features\diagnosis\data\datasources
md lib\features\diagnosis\data\models
md lib\features\diagnosis\data\repositories
md lib\features\diagnosis\data\services
md lib\features\diagnosis\bridge
md lib\features\diagnosis\routes

REM Feature: camera
md lib\features\camera\presentation\pages
md lib\features\camera\presentation\widgets
md lib\features\camera\presentation\controllers
md lib\features\camera\presentation\providers
md lib\features\camera\domain\entities
md lib\features\camera\domain\usecases
md lib\features\camera\domain\repositories
md lib\features\camera\data\datasources
md lib\features\camera\data\models
md lib\features\camera\data\repositories
md lib\features\camera\data\services
md lib\features\camera\bridge
md lib\features\camera\routes

REM Feature: weather
md lib\features\weather\presentation\pages
md lib\features\weather\presentation\widgets
md lib\features\weather\presentation\controllers
md lib\features\weather\presentation\providers
md lib\features\weather\domain\entities
md lib\features\weather\domain\usecases
md lib\features\weather\domain\repositories
md lib\features\weather\data\datasources
md lib\features\weather\data\models
md lib\features\weather\data\repositories
md lib\features\weather\data\services
md lib\features\weather\bridge
md lib\features\weather\routes

REM Feature: market
md lib\features\market\presentation\pages
md lib\features\market\presentation\widgets
md lib\features\market\presentation\controllers
md lib\features\market\presentation\providers
md lib\features\market\domain\entities
md lib\features\market\domain\usecases
md lib\features\market\domain\repositories
md lib\features\market\data\datasources
md lib\features\market\data\models
md lib\features\market\data\repositories
md lib\features\market\data\services
md lib\features\market\bridge
md lib\features\market\routes

REM Feature: community
md lib\features\community\presentation\pages
md lib\features\community\presentation\widgets
md lib\features\community\presentation\controllers
md lib\features\community\presentation\providers
md lib\features\community\domain\entities
md lib\features\community\domain\usecases
md lib\features\community\domain\repositories
md lib\features\community\data\datasources
md lib\features\community\data\models
md lib\features\community\data\repositories
md lib\features\community\data\services
md lib\features\community\bridge
md lib\features\community\routes

REM Feature: maps
md lib\features\maps\presentation\pages
md lib\features\maps\presentation\widgets
md lib\features\maps\presentation\controllers
md lib\features\maps\presentation\providers
md lib\features\maps\domain\entities
md lib\features\maps\domain\usecases
md lib\features\maps\domain\repositories
md lib\features\maps\data\datasources
md lib\features\maps\data\models
md lib\features\maps\data\repositories
md lib\features\maps\data\services
md lib\features\maps\bridge
md lib\features\maps\routes

REM Feature: notifications
md lib\features\notifications\presentation\pages
md lib\features\notifications\presentation\widgets
md lib\features\notifications\presentation\controllers
md lib\features\notifications\presentation\providers
md lib\features\notifications\domain\entities
md lib\features\notifications\domain\usecases
md lib\features\notifications\domain\repositories
md lib\features\notifications\data\datasources
md lib\features\notifications\data\models
md lib\features\notifications\data\repositories
md lib\features\notifications\data\services
md lib\features\notifications\bridge
md lib\features\notifications\routes

REM Feature: reports
md lib\features\reports\presentation\pages
md lib\features\reports\presentation\widgets
md lib\features\reports\presentation\controllers
md lib\features\reports\presentation\providers
md lib\features\reports\domain\entities
md lib\features\reports\domain\usecases
md lib\features\reports\domain\repositories
md lib\features\reports\data\datasources
md lib\features\reports\data\models
md lib\features\reports\data\repositories
md lib\features\reports\data\services
md lib\features\reports\bridge
md lib\features\reports\routes

REM Feature: profile
md lib\features\profile\presentation\pages
md lib\features\profile\presentation\widgets
md lib\features\profile\presentation\controllers
md lib\features\profile\presentation\providers
md lib\features\profile\domain\entities
md lib\features\profile\domain\usecases
md lib\features\profile\domain\repositories
md lib\features\profile\data\datasources
md lib\features\profile\data\models
md lib\features\profile\data\repositories
md lib\features\profile\data\services
md lib\features\profile\bridge
md lib\features\profile\routes

REM Feature: settings
md lib\features\settings\presentation\pages
md lib\features\settings\presentation\widgets
md lib\features\settings\presentation\controllers
md lib\features\settings\presentation\providers
md lib\features\settings\domain\entities
md lib\features\settings\domain\usecases
md lib\features\settings\domain\repositories
md lib\features\settings\data\datasources
md lib\features\settings\data\models
md lib\features\settings\data\repositories
md lib\features\settings\data\services
md lib\features\settings\bridge
md lib\features\settings\routes

REM Feature: voice_assistant
md lib\features\voice_assistant\presentation\pages
md lib\features\voice_assistant\presentation\widgets
md lib\features\voice_assistant\presentation\controllers
md lib\features\voice_assistant\presentation\providers
md lib\features\voice_assistant\domain\entities
md lib\features\voice_assistant\domain\usecases
md lib\features\voice_assistant\domain\repositories
md lib\features\voice_assistant\data\datasources
md lib\features\voice_assistant\data\models
md lib\features\voice_assistant\data\repositories
md lib\features\voice_assistant\data\services
md lib\features\voice_assistant\bridge
md lib\features\voice_assistant\routes

REM Feature: analytics
md lib\features\analytics\presentation\pages
md lib\features\analytics\presentation\widgets
md lib\features\analytics\presentation\controllers
md lib\features\analytics\presentation\providers
md lib\features\analytics\domain\entities
md lib\features\analytics\domain\usecases
md lib\features\analytics\domain\repositories
md lib\features\analytics\data\datasources
md lib\features\analytics\data\models
md lib\features\analytics\data\repositories
md lib\features\analytics\data\services
md lib\features\analytics\bridge
md lib\features\analytics\routes

echo.
echo AgriLink Edge structure created successfully.
pause