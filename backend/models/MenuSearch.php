<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Menu;

/**
 * MenuSearch represents the model behind the search form about `common\models\Menu`.
 */
class MenuSearch extends Menu
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'parent_id', 'type', 'status', 'created_at', 'updated_at'], 'integer'],
            [['name', 'url', 'icon', 'start_created_at', 'start_updated_at', 'end_created_at', 'end_updated_at'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Menu::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $start = '2000-00-00 00:00:00';
        $end = '2100-00-00 00:00:00';

        if ($this->start_created_at || $this->end_created_at) {
            if (!$this->start_created_at) {
                $this->start_created_at = $start;
            }

            if (!$this->end_created_at) {
                $this->end_created_at = $end;
            }

            $query->andFilterWhere(['between', 'created_at', strtotime($this->start_created_at), strtotime($this->end_created_at)]);
        }

        if ($this->start_updated_at || $this->end_updated_at) {
            if (!$this->start_updated_at) {
                $this->start_updated_at = $start;
            }

            if (!$this->end_updated_at) {
                $this->end_updated_at = $end;
            }

            $query->andFilterWhere(['between', 'updated_at', strtotime($this->start_updated_at), strtotime($this->end_updated_at)]);
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'parent_id' => $this->parent_id,
            'type' => $this->type,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'url', $this->url])
            ->andFilterWhere(['like', 'icon', $this->icon]);

        return $dataProvider;
    }
}
