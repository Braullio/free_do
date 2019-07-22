$('#modal_list').on('show.bs.modal', function(e) {
  var listId = $(e.relatedTarget).data('list-id');
  $(e.currentTarget).find('input[name="list_id"]').val(listId);

  var listId = $(e.relatedTarget).data('list-id');
  $(e.currentTarget).find('input[name="list_id_del"]').val(listId);

  var listName = $(e.relatedTarget).data('list-name');
  $(e.currentTarget).find('input[name="title"]').val(listName);

  var boardId = $(e.relatedTarget).data('list-board-id');
  $(e.currentTarget).find('input[name="board_id"]').val(boardId);
});
