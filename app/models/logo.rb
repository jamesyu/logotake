class Logo < ActiveRecord::Base
  def self.top(limit = 20)
    find_by_sql("select *, count(1) as s from logos where text != '' group by text order by s desc limit #{limit}")
  end
end
