require_relative '../test_helper'
class TestInvoice < Minitest::Test
  def setup
    @invoice_data =  {
        "customerNo": "THO4343",
        "date": 1492142400000,
        "details": [
            {
                "description": "CHRA, H1C",
                "interchanges": [
                    4215,
                    5270
                ],
                "partId": 6541,
                "partNumber": "1-B-4106",
                "partTypeName": "Cartridge"
            }
        ],
        "headerSeqNo": "000000",
        "no": "0133092",
        "updated": 1492401600000
    }
    @invoice_api = TurboCassandra::API::Invoice.new
    @last_date = 1446177600000
  end
  def test_save
      data = @invoice_data.to_json
      data = JSON.parse data
      result =  @invoice_api.save_invoice data
      p result
  end

  def test_find_invoice_by_product
    result =  @invoice_api.get_invoice_by_product  46779
    refute_nil result
  end

  def test_find_product_by_invoice
    result =  @invoice_api.get_product_by_invoice  '0055360000000MIC0080'
    refute_nil result
  end

  def test_ranker_api
    ranker = TurboCassandra::API::Ranker.new
    ranked = ranker.rank_bougt_products  48208
    assert_equal 10, ranked.size
  end



end