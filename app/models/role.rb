# encoding: UTF-8
class Role < ActiveRecord::Base
  has_many :rol_asignacions
  has_many :usuarios, :through => :rol_asignacions
end