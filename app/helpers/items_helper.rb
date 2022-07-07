module ItemsHelper
  class MyWorker
    include Rails.application.routes.url_helpers

    def my_url
      polymorphic_url(@item.item_image).variant(resize: "300x300")
    end
  end
end
