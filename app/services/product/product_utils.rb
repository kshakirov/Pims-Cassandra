module ProductUtils
  def bin_to_hex(s)
    s.each_byte.map { |b| b.to_i }
  end

  def hex_to_bin(s)
    s.map { |x| x.chr }.join
  end

  def get_paging_state params
    if params.key? 'paging_state' and params['paging_state']
      hex_to_bin(params['paging_state'])
    end
  end

  def get_page_size params
    if params.key? 'page_size' and params['page_size']
      params['page_size']
    else
      10
    end
  end
end