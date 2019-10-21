$(function() {
  $('#historyModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var modal = $(this)
    var name = button.data('name')
    var klasses = button.data('klasses')
    var absenses = button.data('absenses')
    var justifications = button.data('justifications')
    var total = absenses - justifications

    modal.find('#name').text(name)
    modal.find('#absenses').text(absenses)
    modal.find('#justifications').text(justifications)

    if (klasses === "") {
      modal.find('#klasses').text('-')
    } else {
      modal.find('#klasses').text(klasses)
    }

    if (total < 0) {
      modal.find('#total').text('0');
    } else {
      modal.find('#total').text(total);
    }
  })
})
