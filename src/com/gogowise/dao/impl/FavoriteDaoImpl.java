package com.gogowise.dao.impl;

import com.gogowise.dao.FavoritDao;
import com.gogowise.domain.Favorite;
import org.springframework.stereotype.Repository;

@Repository("favoriteDao")
public class FavoriteDaoImpl extends ModelDaoImpl<Favorite> implements FavoritDao {


}
