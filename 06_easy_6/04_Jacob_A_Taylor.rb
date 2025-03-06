def reverse!(array)
  temp = array.clone
  array.map! { |_| temp.pop }
end
