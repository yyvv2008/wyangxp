<?php

namespace backend\controllers;

use Yii;
use common\models\Learning;
use backend\models\LearningSearch;
use yii\web\NotFoundHttpException;
use common\components\StatusAction;
use common\components\BaseBackendController;

/**
 * LearningController implements the CRUD actions for Learning model.
 */
class LearningController extends BaseBackendController
{
    /**
     * Lists all Learning models.
     * @return mixed
     */
    public function actionIndex($c)
    {
        $searchModel = new LearningSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Learning model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Learning model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Learning();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->render('view', ['model' => $this->findModel($model->id)]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Learning model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->render('view', ['model' => $this->findModel($model->id)]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Learning model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if ($this->findModel($id)->delete()) {
            yii::$app->getResponse()->format = \yii\web\Response::FORMAT_JSON;
            return ['code' => 0, 'message' => yii::t('app', 'Success')];
        }
        
        $errors = $model->getErrors();
        $err = '';
        foreach ($errors as $v) {
            $err .= $v[0] . '<br>';
        }

        return ['code' => 1, 'message' => $err];
    }

    /**
     * Finds the Learning model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Learning the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Learning::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionStatus($id = 0, $field = 'status', $val = 0)
    {
        $model = Learning::findOne($id);
        if (! $model) {
            return ['code' => 1, 'message' => "Cannot find model by $id"];
        }

        return $this->updateStatus($model, $field, $val);
    }
}
