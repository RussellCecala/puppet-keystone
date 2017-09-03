require 'puppet/util/inifile'

Facter.add(:fernet_keys) do
  setcode do
    fernet_keys = {}

    begin
        @keystone_config = Puppet::Util::IniConfig::File.new
        @keystone_config.read('/etc/keystone/keystone.conf')
        key_repository = @keystone_config["fernet_tokens"]["key_repository"].strip
        Dir.glob("#{key_repository}/*").each do |fernet_file|
          data = File.read(fernet_file)
          if data
            fernet_keys[fernet_file] = { 'content' => data }
          end
        end
    rescue 
        fernet_keys = {}
    end
    fernet_keys
  end
end
