package com.gogowise.dao.system;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.Favorite;
import org.springframework.stereotype.Repository;

@Repository("favoriteDao")
public class FavoriteDaoImpl extends ModelDaoImpl<Favorite> implements FavoritDao {


}
