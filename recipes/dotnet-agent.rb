#
# Cookbook Name:: newrelic
# Recipe:: dotnet-agent
#
# Copyright 2012-2014, Escape Studios
#

include_recipe node['newrelic']['dotnet-agent']['dotnet_recipe']

license = get_newrelic_license('application_monitoring')

windows_package "Install New Relic .NET Agent" do
    source node['newrelic']['dotnet-agent']['https_download']
    options "/qb NR_LICENSE_KEY=#{license} INSTALLLEVEL=#{node['newrelic']['dotnet-agent']['install_level']}"
    installer_type :msi
    action :install
    not_if{File.exists?("C:\\Program Files\\New Relic\\.NET Agent")}
end
