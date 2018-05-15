package com.uu.ssm.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeansException;

public class BeanUtils {

	public static <S, T> T copyProperties(S source, Class<T> targetClass) {
		T dest = null;
		try {
			dest = targetClass.newInstance();
			org.springframework.beans.BeanUtils.copyProperties(source, dest);
			return dest;
		} catch (BeansException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dest;
	}

	public static <S, T> List<T> copyProperties(List<S> source, Class<T> targetClass) {
		List<T> target = new ArrayList<>();
		if (source == null || targetClass == null) {
			return target;
		}
		for (Object src : source) {
			target.add(copyProperties(src, targetClass));
		}
		return target;
	}

}
