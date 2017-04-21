require_relative '../test_helper'


class TestInvoices < Minitest::Test
  def setup

  end

  def test_add_product_invoice
    data = {
        invoice_id: "1",
        sku: 123
    }
    product_invoice = TurboCassandra::Model::ProductInvoice.new(data)
    assert_instance_of TurboCassandra::Model::ProductInvoice, product_invoice
    product_invoice.save
  end

  def test_add_invoice_product
    data = {
        invoice_id: "1",
        sku: 123,
        description: "Test description",
        name: "Test name",
        part_type: "Test part type"
    }
    invoice_product = TurboCassandra::Model::InvoiceProduct.new(data)
    assert_instance_of TurboCassandra::Model::InvoiceProduct, invoice_product
    invoice_product.save
  end

  def test_find
    p TurboCassandra::Model::ProductInvoice.primary_index
    p  TurboCassandra::Model::InvoiceProduct.primary_index
    product_invoice = TurboCassandra::Model::ProductInvoice.find 123, "1"
    refute_nil product_invoice
    assert_instance_of TurboCassandra::Model::ProductInvoice, product_invoice
    invoice_product = TurboCassandra::Model::InvoiceProduct.find "1", 123
    assert_instance_of TurboCassandra::Model::InvoiceProduct, invoice_product
    assert_equal 'Test description', invoice_product.description
  end

  def test_find_in
    invoice_product = TurboCassandra::Model::InvoiceProduct.find_in_by invoice_id: ['0055360000000MIC0080','0057878000000DEAL554']
    refute_nil invoice_product
  end

  def test_distinct
    skus  = TurboCassandra::Model::ProductInvoice.distinct 'sku'
    refute_nil skus
  end





end