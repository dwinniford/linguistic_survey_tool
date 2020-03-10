require_relative './config/environment'

use Rack::MethodOverride 
use SessionsController 
use UsersController 
use SurveysController 
use LocationsController
run ApplicationController

