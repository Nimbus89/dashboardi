class ComparisonFunction < ActiveRecord::Base
  belongs_to :project

  SYMBOLS = { 
  	"gt" => ">",
  	"gte" => ">=",
  	"lt" => "<",
		"lte" => "<=",
		"eq" => "==",
		"neq" => "!="
	}
end
