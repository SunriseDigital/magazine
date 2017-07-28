<?php

class Mobile_MagazineController extends Site_Controller_Action_Http_Mobile
{
  public function indexAction()
  {
    $params = $this->_getAllParams();

    $max_count = 5;

    $article_list = $this->_getArticleList($params, $max_count);

    $this->_requireAssign();
    $this->view->assign('latest_article', array_shift($article_list));
    $this->view->assign('pickup_articles', $article_list);
  }

  public function groupAction()
  {
    $params = $this->_getAllParams();

    if ($this->_checkParams($params) === false)
    {
      $this->_forward404('invalid param exists');
    }

    $max_count = 5;

    $article_list = $this->_getArticleList($params, $max_count);

    $this->_requireAssign();
    $this->view->assign('params', $params);
    $this->view->assign('article_list', $article_list);
  }

  public function categoryAction()
  {
    $params = $this->_getAllParams();

    if ($this->_checkParams($params) === false)
    {
      $this->_forward404('invalid param exists');
    }

    $max_count = 5;

    $article_list = $this->_getArticleList($params, $max_count);

    $this->_requireAssign();
    $this->view->assign('params', $params);
    $this->view->assign('article_list', $article_list);
  }

  public function articleAction()
  {
    $params = $this->_getAllParams();

    if ($this->_checkParams($params) === false)
    {
      $this->_forward404('invalid param exists');
    }

    $article_list = $this->_getConfig()->get('magazine/list', array());

    $article = array();

    foreach ($article_list as $item)
    {
      if ($item['article_id'] == $params['article_id'])
      {
        $article = $item;
        break;
      }
    }

    if (empty($article))
    {
      $this->_forward404('article not found.');
    }

    if (($article['group_id'] != $params['group_id']) || ($article['category_id'] != $params['category_id']))
    {
      $this->_forward404('article not found.');
    }

    $this->_requireAssign();
    $this->view->assign('params', $params);
    $this->view->assign('article', $article);
  }

  private function _requireAssign()
  {
    $this->view->assign('group_list', $this->_getGroupList());
    $this->view->assign('category_list', $this->_getCategoryList());
  }

  private function _getGroupList()
  {
    return $this->_getConfig()->get('magazine/group', array());
  }

  private function _getCategoryList()
  {
    return $this->_getConfig()->get('magazine/category', array());
  }

  private function _getGroupName($id)
  {
    $name = "";

    foreach ($this->_getGroupList() as $group)
    {
      if ($id == $group['id'])
      {
        $name = $group['name'];
        break;
      }
    }

    return $name;
  }

  private function _getCategoryName($id)
  {
    $name = "";

    foreach ($this->_getCategoryList() as $category)
    {
      if ($id == $category['id'])
      {
        $name = $category['name'];
        break;
      }
    }

    return $name;
  }

  /**
   * 
   * 指定されたグループやカテゴリが存在しているかチェック
   * 
   * @return boolean
   */
  private function _checkParams(array $params)
  {
    $bool = true;

    if (isset($params['group_id']))
    {
      $bool = false;

      foreach ($this->_getGroupList() as $group)
      {
        if ($params['group_id'] == $group['id'])
        {
          $bool = true;
          break;
        }
      }
    }

    if (isset($params['group_id']) && isset($params['category_id']))
    {
      $bool = false;

      foreach ($this->_getCategoryList() as $category)
      {
        if (($params['group_id'] == $category['group_id']) && ($params['category_id'] == $category['id']))
        {
          $bool = true;
          break;
        }
      }
    }

    return $bool;
  }

  /**
   * 記事リストを取得します
   * paramsでグループ、カテゴリが指定されている場合は絞り込みを行います
   * 
   * @return array
   */
  private function _getArticleList(array $params, $limit = null)
  {
    $article_list = $this->_getConfig()->get('magazine/list', array());

    krsort($article_list);

    $new_list = array();
    $row_count = 0;

    $smarty = new Sdx_Smarty();

    foreach ($article_list as &$item)
    {
      if (isset($limit) && ($limit <= $row_count))
      {
        break;
      }

      if (isset($params['group_id']) && ($item['group_id'] != $params['group_id']))
      {
        continue;
      }

      if (isset($params['category_id']) && ($item['category_id'] != $params['category_id']))
      {
        continue;
      }

      $new_list[] = $item;

      $row_count++;
    }

    return $new_list;
  }
}
