/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/30 23:24:05 by kefujiwa          #+#    #+#             */
/*   Updated: 2020/07/06 17:29:51 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	is_set(char c, char const *set)
{
	while (*set)
	{
		if (c == *set)
			return (1);
		set++;
	}
	return (0);
}

static char	*find_start(char *s, char *set)
{
	while (*s)
		if (is_set(*s, set))
			s++;
		else
			break ;
	return (s);
}

static char	*find_end(char *s, char *set)
{
	int	index;

	index = ft_strlen(s) - 1;
	while (s[index])
		if (is_set(s[index], set))
			index--;
		else
			break ;
	return (&s[index]);
}

char		*ft_strtrim(char const *s1, char const *set)
{
	char	*str;
	char	*p_str;
	char	*start;
	char	*end;

	if (!s1 || !set)
		return (NULL);
	start = find_start((char*)s1, (char*)set);
	end = find_end((char*)s1, (char*)set);
	if (start == &s1[ft_strlen(s1)])
	{
		if (!(str = (char*)ft_calloc(1, sizeof(char))))
			return (NULL);
	}
	else
	{
		if (!(str = (char*)ft_calloc(end - start + 2, sizeof(char))))
			return (NULL);
		p_str = str;
		while (start <= end)
			*(p_str++) = *(start++);
		*p_str = '\0';
	}
	return (str);
}
