package com.gogowise.repository.system;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.competition.Favorite;
import org.springframework.stereotype.Repository;

@Repository("favoriteDao")
public class FavoriteDaoImpl extends ModelDaoImpl<Favorite> implements FavoritDao {


}
