require "application_system_test_case"

class Admins::ProductsTest < ApplicationSystemTestCase
  setup do
    @admins_product = admins_products(:one)
  end

  test "visiting the index" do
    visit admins_products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit admins_products_url
    click_on "New product"

    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit admins_product_url(@admins_product)
    click_on "Edit this product", match: :first

    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit admins_product_url(@admins_product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
