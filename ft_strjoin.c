/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/30 01:14:24 by kefujiwa          #+#    #+#             */
/*   Updated: 2020/07/06 23:37:05 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	char	*str;
	size_t	len;

	if (!s1 && !s2)
		return (ft_strdup(""));
	else if (!s1)
		return (ft_strdup(s2));
	else if (!s2)
		return (ft_strdup(s1));
	else
	{
		len = ft_strlen(s1) + ft_strlen(s2) + 1;
		str = (char*)ft_calloc(len, sizeof(char));
		if (!str)
			return (NULL);
		ft_strlcpy(str, s1, len);
		ft_strlcat(str, s2, len);
		return (str);
	}
}
