require "./todo_item"

class TodoList
  attr_reader :name, :todo_items

  def initialize(name)
    @name = name
    @todo_items = []
  end

  def add_item(name)
    todo_items.push(TodoItem.new(name))
  end

  def find_index(name)
    found = false
    index = 0

    todo_items.each do |todo_item|
      if todo_item.name == name
        found = true
        break
      else
        index += 1
      end
    end

    if found
      return index
    else
      return nill
    end
  end

  def remove_item(name)
    index = find_index(name)

    if index
      todo_items.delete_at(index)
    else
      return false
    end
  end

  def mark_complete!(name)
    index = find_index(name)

    if index
      todo_items[index].mark_complete!
    else
      return false
    end

  end

  def print(kind='all')
    puts "#{name} List - #{kind} items"
    puts "-" * 30

    todo_items.each do |todo_item|
      case kind
      when 'all'
        puts todo_item
      when 'complete'
        puts todo_item if todo_item.complete?
      when 'incomplete'
        puts todo_item unless todo_item.complete?
      end
    end
  end

end

todo_list = TodoList.new('Programming languages')

todo_list.add_item('Javascript')
todo_list.add_item('PHP')
todo_list.add_item('Ruby')
todo_list.add_item('Perl')

#puts todo_list.inspect
todo_list.remove_item('PHP')
todo_list.mark_complete!('Ruby')
todo_list.print('all')
