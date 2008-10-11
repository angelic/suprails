#
# SuprailsPlugins
# Copyright 2008 Bradley Grzesiak
# This file is part of Suprails.
# 
#     Suprails is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     Suprails is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with Suprails.  If not, see <http://www.gnu.org/licenses/>.
#

module SuprailsPlugins
  def initialize
    @plugins = []
  end
  
  def <<(plugin)
    @plugins.push(plugin)
  end
  
  def load_specified_plugins
    plugins = get_specified_plugins
  end
  
  private
  
  def get_specified_plugins
    available_plugins = []
    Dir.open('plugins') do |dir|
      dir.each {|fn| available_plugins << fn if plugins.include?(fn[/[^\.]*/,0])}
    end
    available_plugins
  end
end