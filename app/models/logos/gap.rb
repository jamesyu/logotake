class Gap < Logo
  def self.top(limit = 20)
    find_by_sql("select *, count(1) as s from logos where text != '' and text != 'Gap' group by text order by s desc limit #{limit}")
  end
end
