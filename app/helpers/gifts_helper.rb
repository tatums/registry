module GiftsHelper

  def helper_field_for(gift_field, gift)
    if gift.remaining_portions <= 0
      'Complete'
    else
      gift_field.select(:quantity, gift.select_helper, {:include_blank => '--'} )
    end
  end

  def helper_portions_for(gift)
    if gift.remaining_portions <= 0
      'Complete'
    else
      gift.remaining_portions
    end
  end


end
