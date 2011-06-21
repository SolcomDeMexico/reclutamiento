class RolAsignacion < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :role
end
