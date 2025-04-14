<?php

namespace App\DataGrids\Admin;

use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use Webkul\DataGrid\DataGrid;

class ContactDataGrid extends DataGrid
{
    protected $index = 'id'; // primary key
    protected $sortOrder = 'desc';
    protected $sortColumn = 'id';

    public function prepareQueryBuilder()
    {
        $this->addFilter('id', 'contacts.id');
        $this->addFilter('name', 'contacts.name');
        $this->addFilter('email', 'contacts.email');
        $this->addFilter('contact', 'contacts.contact');
        $this->addFilter('created_at', 'contacts.created_at');

        $queryBuilder = DB::table('contacts')->addSelect('id', 'name', 'email', 'contact', 'message', 'created_at');
        return $queryBuilder;
    }

    public function prepareColumns()
    {
        $this->addColumn([
            'index' => 'id',
            'label' => 'ID',
            'type'  => 'integer',
            'searchable' => true,
            'filterable' => false,
            'sortable'   => true,
        ]);

        $this->addColumn([
            'index' => 'name',
            'label' => 'Name',
            'type'       => 'string',
            'searchable' => true,
            'filterable' => true,
            'sortable'   => true,
        ]);

        $this->addColumn([
            'index' => 'email',
            'label' => 'Email',
            'type'  => 'string',
            'searchable' => true,
            'filterable' => true,
            'sortable'   => true,
        ]);

        $this->addColumn([
            'index' => 'contact',
            'label' => 'Phone',
            'type'  => 'string',
            'searchable' => true,
            'filterable' => true,
            'sortable'   => true,
        ]);

        $this->addColumn([
            'index' => 'message',
            'label' => 'Message',
            'type'  => 'string',
            'searchable' => true,
            'filterable' => false,
            'sortable'   => true,
        ]);

        $this->addColumn([
            'index' => 'created_at',
            'label' => 'Submitted At',
            'type'  => 'datetime',
            'searchable' => true,
            'filterable' => false,
            'sortable'   => true,
        ]);
    }

    public function prepareActions() {}

    public function prepareMassActions() {}

    public function prepareButtons()
    {
        $this->addExportButton(); // 👈 This enables the export options
    }
}
