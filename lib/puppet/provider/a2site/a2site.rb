Puppet::Type.type(:a2site).provide(:a2site) do
    desc "Manage Apache 2 sites on Debian and Ubuntu"

    optional_commands :encmd => "a2ensite"
    optional_commands :discmd => "a2dissite"

    defaultfor :operatingsystem => [:debian, :ubuntu]

    def create
        encmd resource[:name]
    end

    def destroy
        discmd resource[:name]
    end

    def exists?
        site = "/etc/apache2/sites-enabled/" + resource[:name]
        File.exists?(site)
    end
end
