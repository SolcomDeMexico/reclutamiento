require 'paperclip'
class Usuario < ActiveRecord::Base
  ACCESS_KEY_ID = 'AKIAJ2XF5PYCBBFAWI3Q'
  SECRET_ACCESS_KEY = '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'
  BUCKET = 'fotos_usuarios'
  #belongs_to :departamento
	validates_uniqueness_of :user_id
  validates_presence_of :display_name, :message => "El nombre del usuario es requerido."
  validates_presence_of :email, :message => "El email del usuario es requerido."
  #validates_associated :departamento , :message => "El departamento del usuario debe ser un departamento válido."
  before_save :save_salt  
  has_many :entrevista
  has_many :rol_asignacions
  has_many :roles, :through => :rol_asignacions  
  
  has_attached_file :foto,
      :storage => 's3',
      :bucket => BUCKET,
      :path => ":attachment/:id/:style/:basename.:extension",
      :s3_credentials => { :access_key_id => ACCESS_KEY_ID, :secret_access_key => SECRET_ACCESS_KEY },
      :s3_permissions => 'public-read',
      :styles => { :thumb => "60x60#"}     
      
  validates_attachment_size :foto, :less_than => 4.megabytes, :message => "La foto de perfil no debe exceder los 4MB."
  validates_attachment_content_type :foto , :content_type => ['image/jpeg','image/gif','image/png'] , 
  :message => "La foto de perfil debe estar en formato JPEG,GIF o PNG."    
    
  
  def role_symbols
    roles.map do |role|
      role.nombre.underscore.to_sym
    end
  end
  
	
	def self.authenticate_with_salt(id,cookie_salt)
		usuario = find_by_id(id)
		(usuario && usuario.salt == cookie_salt) ? usuario : nil
	end
	
	private
	
	def save_salt
		self.salt = make_salt if new_record?
	end
	
	def make_salt
		secure_hash("#{Time.now.utc}--#{user_id}")
	end
	
	def secure_hash(string)
		Digest::SHA2.hexdigest(string)
	end
		
end
