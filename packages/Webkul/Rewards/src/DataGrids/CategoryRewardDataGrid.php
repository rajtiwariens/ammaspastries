<?php

namespace Webkul\Rewards\DataGrids;

use Webkul\DataGrid\DataGrid;
use Illuminate\Support\Facades\DB;

class CategoryRewardDataGrid extends DataGrid
{
    /**
     * Prepare query builder.
     *
     * @return \Illuminate\Database\Query\Builder
     */
    public function prepareQueryBuilder()
    {
        $queryBuilder = DB::table('category_rewards')
            ->leftJoin('categories as cat', 'category_rewards.category_id', '=', 'cat.id')
            ->select(
                'category_rewards.id',
                'ct.name',
                'cat.position',
                'category_rewards.status',
                'ct.locale',
                'category_rewards.reward_points',
            )
            ->leftJoin('category_translations as ct', function($leftJoin) {
                $leftJoin->on('cat.id', '=', 'ct.category_id')
                    ->where('ct.locale', app()->getLocale());
            })->groupBy('cat.id');

        $this->addFilter('id', 'category_rewards.id');
        $this->addFilter('status', 'category_rewards.status');

        return $queryBuilder;
    }

    /**
     * prepare columns.
     *
     * @return void
     */
    public function prepareColumns()
    {
        $this->addColumn([
            'index'      => 'id',
            'label'      => trans('rewards::app.admin.rewards.category.index.datagrid.id'),
            'type'       => 'integer',
            'searchable' => false,
            'sortable'   => true,
            'filterable' => true,
        ]);

        $this->addColumn([
            'index'      => 'name',
            'label'      => trans('rewards::app.admin.rewards.category.index.datagrid.name'),
            'type'       => 'string',
            'searchable' => true,
            'sortable'   => true,
            'filterable' => true,
        ]);

        $this->addColumn([
            'index'      => 'reward_points',
            'label'      => trans('rewards::app.admin.rewards.category.index.datagrid.reward-points'),
            'type'       => 'string',
            'searchable' => false,
            'sortable'   => true,
            'filterable' => true,
        ]);

        $this->addColumn([
            'index'      => 'status',
            'label'      => trans('rewards::app.admin.rewards.category.index.datagrid.status'),
            'type'       => 'string',
            'filterable'         => true,
            'searchable'         => true,
            'filterable_type'    => 'dropdown',
            'filterable_options' => [
                        [
                            'label'  => trans('rewards::app.admin.rewards.category.index.datagrid.options.active'),
                            'value'  => '1',
                        ], [
                            'label'  => trans('rewards::app.admin.rewards.category.index.datagrid.options.inactive'),
                            'value'  => '0',
                        ],
                    ],
            
            'closure'    => function ($row) {
                if ($row->status) {
                    return '<span class="label-active">'.trans('rewards::app.admin.rewards.category.index.datagrid.options.active').'</span>';
                }

                return '<span class="label-info">'.trans('rewards::app.admin.rewards.category.index.datagrid.options.inactive').'</span>';
            },
        ]);
    }

    /**
     * Prepare actions.
     *
     * @return void
     */
    public function prepareActions()
    {
        $this->addAction([
            'icon'   => 'icon-edit',
            'title'  => trans('rewards::app.admin.rewards.category.index.datagrid.edit'),
            'method' => 'GET',
            'url'    => function ($row) {
                return route('admin.reward.category.edit_category_reward', $row->id);
            },
        ]);

        $this->addAction([
            'icon'   => 'icon-delete',
            'title'  => trans('rewards::app.admin.rewards.category.index.datagrid.delete'),
            'method' => 'POST',
            'url'    => function ($row) {
                return route('admin.reward.category.delete_category_reward', $row->id);
            },
        ]);
    }

    /**
     * Prepare mass actions.
     *
     * @return void
     */
    public function prepareMassActions()
    {
        $this->addMassAction([
            'title'  => trans('rewards::app.admin.rewards.category.index.datagrid.delete'),
            'url'    => route('admin.reward.category.mass_delete'),
            'method' => 'POST',
        ]);

        $this->addMassAction([
            'title'  => trans('rewards::app.admin.rewards.category.index.datagrid.update-status'),
            'method' => 'POST',
            'url'    => route('admin.reward.category.mass_update'),
            'options' => [
                [
                    'label' => trans('rewards::app.admin.rewards.category.index.datagrid.options.active'),
                    'value' => 1,
                ], [
                    'label' => trans('rewards::app.admin.rewards.category.index.datagrid.options.inactive'),
                    'value' => 0,
                ],
            ],
        ]);
    }
}