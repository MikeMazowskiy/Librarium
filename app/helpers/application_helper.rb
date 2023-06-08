module ApplicationHelper
  def tailwind_classes_for(flash_type)
    {
      notice: 'max-w-sm w-full shadow-lg px-4 py-3 rounded relative bg-green-500 border-l-4 border-green-700 text-white
               pointer-events-auto transition translate-x-full transform ease-in-out duration-500',
      error:  'max-w-sm w-full shadow-lg px-4 py-3 rounded relative bg-red-600 border-l-4 border-red-700 text-white
               pointer-events-auto transition translate-x-full transform ease-in-out duration-500',
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

end
