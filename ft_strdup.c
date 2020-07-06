/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/30 01:14:17 by kefujiwa          #+#    #+#             */
/*   Updated: 2020/07/06 23:35:31 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strdup(const char *s1)
{
	char	*copy_s1;
	size_t	len;

	len = ft_strlen(s1) + 1;
	copy_s1 = (char*)ft_calloc(len, sizeof(char));
	if (!copy_s1)
		return (NULL);
	ft_strlcpy(copy_s1, s1, len);
	return (copy_s1);
}
