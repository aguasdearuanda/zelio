$(function () {
  var table = $('#datatable').DataTable({
    lengthChange: true,
    order: [],
    buttons: [
      {
        extend: 'copyHtml5', text: 'Copiar'
      },
      'excelHtml5',
      {
        extend: 'pdfHtml5',
        orientation: 'landscape',
        pageSize: 'A4',
        customize: function ( doc ) {
          doc.defaultStyle.fontSize = 7;
          doc.styles.tableHeader.fontSize = 7;
          doc.styles.title.fontSize = 9;
        }
      }],
    language: {
      buttons: {
        copyTitle: 'Copiado para área de transfência',
        copySuccess: {
          _: '%d linhas copiadas',
          1: '1 copiada'
        },
        excelHtml5: 'Excel',
        pdfHtml5: 'PDF'
      },
      "sEmptyTable": "Nenhum registro encontrado",
      "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
      "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
      "sInfoFiltered": "(Filtrados de _MAX_ registros)",
      "sInfoPostFix": "",
      "sInfoThousands": ".",
      "sLengthMenu": "_MENU_ resultados por página",
      "sLoadingRecords": "Carregando...",
      "sProcessing": "Processando...",
      "sZeroRecords": "Nenhum registro encontrado",
      "sSearch": "Pesquisar",
      "oPaginate": {
        "sNext": "Próximo",
        "sPrevious": "Anterior",
        "sFirst": "Primeiro",
        "sLast": "Último"
      },
      "oAria": {
        "sSortAscending": ": Ordenar colunas de forma ascendente",
        "sSortDescending": ": Ordenar colunas de forma descendente"
      }
    }
  });

  table.buttons().container()
    .appendTo('#datatable_wrapper .col-md-6:eq(0)');
});
