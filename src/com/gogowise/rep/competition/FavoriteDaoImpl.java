package com.gogowise.rep.competition;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.competition.enity.Favorite;
import org.springframework.stereotype.Repository;

@Repository("favoriteDao")
public class FavoriteDaoImpl extends ModelDaoImpl<Favorite> implements FavoritDao {


}
